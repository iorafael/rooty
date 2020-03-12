landing = document.getElementById("landing")
if (landing){
    $(function () {

        $('#distance').mobiscroll().number({
            theme: 'ios',
            themeVariant: 'light',
            maxWidth: 100
        });
    });
}