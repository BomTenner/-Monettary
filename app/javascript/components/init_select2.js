import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.choose-asset').select2({
    placeholder: "Choose Asset",
  });
};

export { initSelect2 };
