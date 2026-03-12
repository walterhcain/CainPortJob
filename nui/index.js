const date = new Date();

const app = new Vue({
    el: '#tablet',
    data: {
        opened: false,
        currentPage: "main",
        barcode: "0",
        Calendar: {
            day: date.toLocaleDateString('en-US', { 
                weekday: 'long' 
            }),
            date: date.getDate()
        },
    },
    mounted() {
        let initial = document.getElementById(this.currentPage);
        initial.style.opacity = 1;
    },
    methods: {
        async post(url, data = {}) {
            const response = await fetch(`https://${GetParentResourceName()}/${url}`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });
            
            return await response.json();
        },
        setPageOpacity(id, value) {
            let page = document.getElementById(id);
            page.style.opacity = value;
        },
        async switchPage(page) {
            if (page == 'main'){
                return await app.post('close');
            }
            if (this.currentPage == page) return;

            this.setPageOpacity(this.currentPage, 0);
            this.currentPage = page;
            
            setTimeout(() => {
                this.setPageOpacity(page, 1);
            }, 50);
        },
        async searchManifest(bcode){
            //Get Barcode Result
            let bar = document.getElementById(bcode);
            var barv = bar.value;
            if(barv != this.barcode){
                return await app.post('wrongBar');
            }
            this.switchPage('manifest')
        },
        async registerContainer(bcode, baycode, front, side, back) {
            //Get Bay Result
            let ba = document.getElementById(baycode);
            var bav = ba.value;

            //Get Barcode Result
            let bar = document.getElementById(bcode);
            var barv = bar.value;

            //Get Front Damage Result
            let fron = document.getElementById(front);
            var fronv = fron.checked;

            //Get Side Damage Result
            let sid = document.getElementById(side);
            var sidv = sid.checked;

            //Get Back Damage Result
            let bac = document.getElementById(back);
            var bacv = bac.checked;

            app.opened = false;
            if(barv != this.barcode){
                return await app.post('wrongBar');
            }
            return await app.post('registerContainer', {
                barcode: barv,
                bay: bav,
                front: fronv,
                side: sidv,
                back: bacv,
            })
        },
    }
});

window.addEventListener('message', async ({ data }) => {
    switch(data.action) {
        case 'open':
            app.opened = true;
            app.currentPage = data.page
            if (data.barcode != null){
                app.barcode = data.barcode;
                app.manifest = data.manifest;
                app.origin = data.origin;
                app.frontDamage = data.frontDamage;
                app.sideDamage = data.sideDamage;
                app.backDamage = data.backDamage;
                app.bay = data.bay;
            }
            break;
        case 'close':
            app.opened = false;
            break;
    }
});

window.addEventListener('keydown', async ({ key }) => {
    let which = key.toLowerCase();

    if (which == 'escape')
        return await app.post('close');
});
