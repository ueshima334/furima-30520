function price(){
  const price_form = document.getElementById("item-price");
  price_form.addEventListener('input',()=>{
    const formData = price_form.value
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(formData * 0.1);
    profit.innerHTML = Math.floor(formData * 0.9) ;
  })
}
window.addEventListener("turbolinks:load",price);