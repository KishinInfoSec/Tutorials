fetch(handler_object.ajax_url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: 'action=woodmart_ajax_search&number=20&post_type=*&query=*'
})
.then(res => res.json())
.then(data => {
    console.log("%c[+] WoodMart Search Results:", "color: #00ff00; font-weight: bold;");
    console.dir(data);
});