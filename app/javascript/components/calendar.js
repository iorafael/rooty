import 'flatpickr/dist/flatpickr.min.css'
import flatpickr from 'flatpickr';
flatpickr(".datepicker", {
    altInput: true,
    enableTime: true,
    disableMobile: true
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