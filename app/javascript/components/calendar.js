import 'flatpickr/dist/flatpickr.min.css'
flatpickr(".datepicker", {
    altInput: true,
    enableTime: true
});

const events = document.querySelectorAll(".event-creator");
if (events){
    events.forEach((event) => {
            event.addEventListener("click", (event) => {
            console.log(event)
            const route = event.currentTarget.dataset.route;
            $('#event_route').val(route);
        });
    });
}