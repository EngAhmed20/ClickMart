import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/data/data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class OnbordingBody extends StatelessWidget {
   OnbordingBody({Key? key}) : super(key: key);
  OnBoardingControllerImp controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (value){
                controller.onPageChange(value);
              },
              itemCount: onBordingList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Text('${onBordingList[index].title}',
                      style: textStyle.Bold23),
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    '${onBordingList[index].image}',
                    fit: BoxFit.fill,
                    height: 300,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                      width: double.infinity,
                      child: Text(
                        '${onBordingList[index].body}',
                        style: textStyle.semiBold16,
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  GetBuilder<OnBoardingControllerImp>(builder:(controller)=>Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        onBordingList.length,
                            (index) => AnimatedContainer(
                          height: 9,
                          width: controller.currentPage==index?20:9,
                          margin: EdgeInsets.only(right: 5),
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),),
                  Spacer(flex: 2,),
                  Container(
                    height: 50,
                    width: 250,
                    child: MaterialButton(onPressed: (){
                      controller.next();
                    },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Continue'.tr,style: textStyle.semiBold20.copyWith(color: Colors.white),),
                    ),
                  ),
                  Spacer(flex: 1,),
                ],
              )),
        ],
      ),
    );
  }
}
