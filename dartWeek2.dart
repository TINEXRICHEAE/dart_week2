// Function to calculate total cost
double calculateTotal(List<double> prices, [double taxRate = 0.0]) {
  double total = 0.0;
  
  // Calculate total price without tax
  for (var price in prices) {
    total += price;
  }

  // Add tax if taxRate is provided
  if (taxRate > 0.0) {
    total += total * taxRate;
  }

  return total;
}

// Anonymous function to filter items within a specific price range
void filterPrices(List<double> prices, double minPrice, double maxPrice) {
  prices.forEach((price) {
    if (price >= minPrice && price <= maxPrice) {
      print('Item price: \$${price}');
    }
  });
}

// Recursive function to calculate discount
double applyDiscount(double total, int items, double discountPercentage) {
  // Base case: If there's only one item left, apply the discount and return total
  if (items == 1) {
    return total - (total * discountPercentage / 100);
  }
  
  // Recursive case: Decrease the number of items and apply discount
  return applyDiscount(total, items - 1, discountPercentage);
}

void main() {
  // List of item prices in the shopping cart
  List<double> prices = [50.0, 30.0, 20.0, 40.0, 60.0];

  // Calculate total with tax (optional)
  double totalWithoutTax = calculateTotal(prices);
  double totalWithTax = calculateTotal(prices, 0.05); // 5% tax

  print('Total cost without tax: \$${totalWithoutTax}');
  print('Total cost with tax: \$${totalWithTax}');

  // Use anonymous function to filter items priced between 30 and 60
  print('\nFiltered Prices between 30 and 60:');
  filterPrices(prices, 30, 60);

  // Apply a discount based on the number of items in the cart
  double discount = 10.0; // 10% discount
  int itemCount = prices.length;
  double discountedTotal = applyDiscount(totalWithTax, itemCount, discount);

  print('\nTotal after discount: \$${discountedTotal}');
}
