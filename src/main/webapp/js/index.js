// ========================== Header section ==============================

const navOpen = document.querySelector('.mobile-open-btn')
const navClose = document.querySelector('.mobile-close-btn')
const primaryNavigation = document.getElementById('primary-navigation');

navOpen.addEventListener('click', () => {
    const visibility = primaryNavigation.getAttribute('data-visible');
    if (visibility === 'false') {
        primaryNavigation.setAttribute('data-visible', true);
        navClose.setAttribute('data-visible', true);
    } else {
        primaryNavigation.setAttribute('data-visible', false);
        navClose.setAttribute('data-visible', false);
    }
})

navClose.addEventListener('click', () => {
    const visibility = primaryNavigation.getAttribute('data-visible');

    if (visibility === 'true') {
        primaryNavigation.setAttribute('data-visible', false);
        navClose.setAttribute('data-visible', false);
    }
})


//  ==================== cart menu ============================

const shoppingBag = document.getElementById('cart-box');
const CartItem = document.getElementById('cart-icon');
const crossBtn = document.getElementById('cross-btn');


const xBtn = document.getElementById('x-btn');

var r = document.querySelector(':root');

function togmenu() {
   
    let currentValue = getComputedStyle(r).getPropertyValue('--no');


    if (currentValue === '0px') {
        r.style.setProperty('--no', '400px');
    } else {
        r.style.setProperty('--no', '0px');
    }
}

function togcart() {
   
    let currentValue = getComputedStyle(r).getPropertyValue('--sho');


    if (currentValue === '0px') {
        r.style.setProperty('--sho', '400px');
    } else {
        r.style.setProperty('--sho', '0px');
    }
}

xBtn.addEventListener('click', () => {
    const showUser = userItem.getAttribute('data-visible');

    if (showUser === 'true') {
        userItem.setAttribute('data-visible', false)
    }


})



shoppingBag.addEventListener('click', () => {
    const showCart = CartItem.getAttribute('data-visible');

    if (showCart === 'false') {
        CartItem.setAttribute('data-visible', true)
    } else {
        CartItem.setAttribute('data-visible', false)
    }
})

function sct(pd) {
           const targetElement = document.getElementById(pd);
           if (targetElement) {
               targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
           }
       }



// ================================================ scroll trigger ==================================================







