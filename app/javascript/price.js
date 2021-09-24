function calculation (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input",() => {
    const inputValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const commission = inputValue * 0.1;
    addTaxPrice.innerHTML = Math.floor(commission).toLocaleString();
    const profitPrice = document.getElementById("profit");
    const profit = inputValue * 0.9;
    profitPrice.innerHTML = Math.floor(profit).toLocaleString();
  });
};

window.addEventListener("load", calculation);