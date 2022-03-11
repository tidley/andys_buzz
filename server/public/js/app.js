// check value of input from api

$(document).ready(() => {
  console.log('Components loading...');

  // DOM components
  //   const inputBox = document.getElementById('input-text');

  // // Function calls
  // $('#add-data').click(() => { addData(inputBox.value); });
  // $('#get-data').click(() => { getData(cidBox.value); });
  // $('#add-file').click(() => { addFile(); });
  // $('#get-image').click(() => { getImage(cidBox.value); });
  checkStatus();
  console.log('Component loading complete.');
});

async function addData(newData) {
  axios
    .post('/addData', {
      data: newData,
    })
    .then((response) => {
      $('#output-text').val(response.data.path);
    });
}

async function checkStatus() {
  // setInterval(() => {
  axios.post('/state', {}).then((response) => {
    console.log(response.data);
    document.body.style.background = response.data == true ? 'green' : 'red';
    checkStatus();
  });
  // }, 500);
}

// TODO https://www.npmjs.com/package/node-fetch
