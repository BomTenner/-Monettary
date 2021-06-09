// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("plugins/unlock")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "chartkick/chart.js"
import "chartkick"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initExchange, initAmountExchange } from '../components/exchange';
import { initScanExchanges } from '../components/scanning_exchanges';
import { initMoveIt } from '../components/scanning_exchanges';
import { initTimer } from '../components/scanning_exchanges';

import { tabToggle } from '../components/homepage';

import { friendsToggle } from '../components/friends_page';


import { initTransfer, initConvertAmount } from '../components/transfer';
import { initClickSelect, initMoveProcessing } from '../components/select_exchange';


import { initStakingCounter } from '../components/staking_countdown'

import { initSaveContact } from '../components/save_contact'


document.addEventListener('turbolinks:load', () => {
  //Call your functions here, e.g:
  initExchange();
  initScanExchanges();
  initMoveIt();
  initTimer();
  initAmountExchange();
  friendsToggle()
  tabToggle();

  initTransfer();
  initConvertAmount();

  initClickSelect();
  initMoveProcessing();

  initStakingCounter();

  initSaveContact();
});


import "controllers"
