import 'flatpickr/dist/flatpickr.min.css'
flatpickr(".datepicker", {
});

const events = document.querySelectorAll(".event-creator");
if (events){
    events.forEach((event) => {
            event.addEventListener("click", (event) => {
            const route = event.currentTarget.dataset.route;
            $('#event_route').val(route);
        });
    });
}