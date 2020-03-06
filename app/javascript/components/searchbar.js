searchbar = document.querySelector('.searchbar')
    if(searchbar){
        searchbar.addEventListener('touchstart',(event) => {
    event.currentTarget.classList.toggle('hover_effect')
    })
}
