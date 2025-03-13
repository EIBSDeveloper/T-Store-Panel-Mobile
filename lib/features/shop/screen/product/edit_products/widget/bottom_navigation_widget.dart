import '../../../../../../utils/constants/path_provider.dart';

class ProductBottomNavigationWidget extends StatelessWidget {
  const ProductBottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(onPressed: () {}, child: Text('Discard')),
          SizedBox(width: TSizes.spaceBtwItems / 2),
          SizedBox(
              width: 160,
              child:
                  ElevatedButton(onPressed: () {}, child: Text("Save Changes")))
        ],
      ),
    );
  }
}
