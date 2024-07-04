function price (){
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("input",function(){
    const itemPrice = inputPrice.value;

    const calcTaxPrice = Math.floor( itemPrice * 0.1 );
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.textContent = calcTaxPrice;

    const calcProfit = Math.floor( itemPrice - calcTaxPrice );
    const profit = document.getElementById("profit");
    profit.textContent = calcProfit;
  });
};

window.addEventListener('turbo:load', price);