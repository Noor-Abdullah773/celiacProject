import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/productState.dart';
import '../../view_model/ProductByBarcodeVM.dart';
import '../widgets/bigStack.dart';
import '../widgets/customContainerDialog.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({super.key, required this.product});
  late Product product;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  var future;
  Future<ProductState?>? receivedData() async {
    final result =  await ProductByBarcodeVM(Dio()).get(barcode: widget.product.barcode);
    return result!.fold(
      (failure) {
        // Handle the failure case
        print('Error: ${failure.errorMessage}');
        return null;
      },
      (productState) {
        // Handle the success case
        return productState;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    future = receivedData();
  // future = ProductByBarcodeVM(Dio()).get(barcode: widget.product.barcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BigStuck(
        widget: Padding(
          padding:
              const EdgeInsets.only(right: 30, left: 30, top: 25, bottom: 40),
          child: Column(children: [
            GestureDetector(
              child: const Row(
                children: [
                  Text(
                    '<  ',
                    style: AppTextStyle.bold12_mediemGrey,
                  ),
                  Text(
                    'رجوع',
                    style: AppTextStyle.bold12_mediemGrey,
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(widget.product.productName,
                      style: AppTextStyle.bold25_black),
                ),
                Expanded(
                  child: SizedBox(
                    height: 102,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: widget.product.imageURL != null
                          ? Image.network(widget.product.imageURL!.path,
                              fit: BoxFit.fill)
                          : Image.asset(
                              'assets/images/image 1.png',
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Divider(color: AppColors.lightGrey, thickness: 2),
            const SizedBox(
              height: 39,
            ),
            FutureBuilder<ProductState?>(
                future: future,
                builder: (con, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> mapInfo =
                        ProductByBarcodeVM(Dio()).checkState(
                      productSafetyStatus: snapshot.data!.productSafetyStatus,
                    );
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: mapInfo['colorContainer']),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                        child: Column(
                          children: [
                            Icon(mapInfo['icon'],
                                color: mapInfo['colorIcon'],
                                size: 28,
                                textDirection: TextDirection.ltr),
                            Text(
                              mapInfo['state'],
                              style: mapInfo['textStyle'],
                              textAlign: TextAlign.center,
                            ),
                            Text(
                                ProductByBarcodeVM(Dio()).checkType(
                                    type: mapInfo['type'],
                                    positiveVotes: widget.product.positiveVotes,
                                    negativeVotes:
                                        widget.product.negativeVotes),
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bold10_black),
                            mapInfo['type'] == 4
                                ? const CustomContainerDialog(
                                    height: 29,
                                    width: 139,
                                    color: AppColors.darkBlue,
                                    text: 'ابدأ المسح',
                                    textStyle: AppTextStyle.bold12_white,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('error');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
          ]),
        ),
      ),
    );
  }
}
