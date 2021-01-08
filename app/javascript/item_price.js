  window.addEventListener('load', () => {
 const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profitPrice = document.getElementById("profit");
    const value_result = inputValue * 0.1
    addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1 ));
    profitPrice.innerHTML = (Math.floor(inputValue - value_result ));
  })
});