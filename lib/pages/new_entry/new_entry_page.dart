import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/medicine_type.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  @override
  late GlobalKey<ScaffoldState> _scaffoldKey;
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Add New'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            PanelTitle(title: 'Medicine Name', isRequired: true),
            TextFormField(
              controller: nameController,
              maxLength: 12,
              decoration: const InputDecoration(border: UnderlineInputBorder()),
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: kotherColor),
            ),
            PanelTitle(title: 'Dosage in mg', isRequired: false),
            TextFormField(
              controller: dosageController,
              maxLength: 12,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: UnderlineInputBorder()),
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: kotherColor),
            ),
            SizedBox(
              height: 3.h,
            ),
            PanelTitle(title: 'Medicine Type', isRequired: false),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: StreamBuilder(
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      MedicineTypeColumn(
                          medicineType: MedicineType.bottle,
                          name: 'Bottle',
                          iconValue: 'assets/icons/bottle.svg',
                          isSelected: snapshot.data == MedicineType.bottle
                              ? true
                              : false),
                      MedicineTypeColumn(
                          medicineType: MedicineType.pill,
                          name: 'Pill',
                          iconValue: 'assets/icons/pill.svg',
                          isSelected: snapshot.data == MedicineType.pill
                              ? true
                              : false),
                      MedicineTypeColumn(
                          medicineType: MedicineType.syringe,
                          name: 'Syringe',
                          iconValue: 'assets/icons/syringe.svg',
                          isSelected: snapshot.data == MedicineType.syringe
                              ? true
                              : false),
                      MedicineTypeColumn(
                          medicineType: MedicineType.tablet,
                          name: 'Tablet',
                          iconValue: 'assets/icons/tablet.svg',
                          isSelected: snapshot.data == MedicineType.tablet
                              ? true
                              : false)
                    ],
                  );
                },
                stream: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn(
      {super.key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.isSelected});
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
              width: 19.w,
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
                color: kotherColor,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 1.h,
                    bottom: 1.h,
                  ),
                  child: SvgPicture.asset('assets/icons/pill.svg'),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 20.w,
                height: 4.h,
                decoration: BoxDecoration(
                    color: kotherColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Pill",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({super.key, required this.title, required this.isRequired});
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextSpan(
              text: isRequired ? '*' : "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: kPrimaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
