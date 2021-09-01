const nav_link_slide = () =>{
    const mobile = document.querySelector('.mobile')
    const nav = document.querySelector('.nav-links')

    mobile.addEventListener('click', () => {
        nav.classList.toggle('nav-active');
    });
}
nav_link_slide();