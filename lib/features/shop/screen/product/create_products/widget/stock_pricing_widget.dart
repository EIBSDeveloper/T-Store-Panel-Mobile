import 'package:flutter/services.dart';

import '../../../../../../utils/constants/path_provider.dart';
import '../../../../../../utils/validators/validation.dart';

class ProductStockAndPricing extends StatelessWidget {
  const ProductStockAndPricing({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FractionallySizedBox(
            //--	Resizes child based on a fraction of its parent's size.todo: Act Like Percentage size
            widthFactor: 0.45,
            child: TextFormField(
              maxLength: 8,
              validator: (value) =>
                  TValidator.validateEmptyText("Stock", value),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  counterText: '',
                  labelText: "Stock",
                  hintText: "Add Stock, only numbers are allowed"),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// -- Pricing
          Row(
            children: [
              /// Pricing
              Expanded(
                  child: TextFormField(
                maxLength: 10,
                validator: (value) =>
                    TValidator.validateEmptyText("Stock", value),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))
                ],
                decoration: InputDecoration(
                    counterText: '',
                    labelText: "Price",
                    hintText: "Price with up-to 2 decimals"),
              )),
              SizedBox(width: TSizes.spaceBtwInputFields),

              /// -- Sale Price
              Expanded(
                  child: TextFormField(
                maxLength: 10,
                validator: (value) =>
                    TValidator.validateEmptyText("Discounted Price", value),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))
                ],
                decoration: InputDecoration(
                    counterText: '',
                    labelText: "Discounted Price",
                    hintText: "Price with up-to 2 decimals"),
              )),
            ],
          )
        ],
      ),
    );
  }
}
