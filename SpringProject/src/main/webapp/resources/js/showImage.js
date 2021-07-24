$('#upload').change(function(){
    setImageFromFile(this, '#poster');
    setImageFromFile(this, '[name=confirm_img]');
});

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(expression).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}