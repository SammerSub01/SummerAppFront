require('./sresult.tag');
<gresult>

    <sresult each={wd}></sresult>
    <script>
        this.wd = '( Loading... )'
        var self = this;
        fetch( 'http://160.237.176.108/weather' )
                .then( function ( data ) {
                    return data.json();
                } )
                .then( function ( json ) {
                    console.log(json);
                    self.wd = json;
                    self.update();
                } )
    </script>
</gresult>