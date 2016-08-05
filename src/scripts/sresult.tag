<sresult>
    <!--<p>Temp2:{description}</p>
    <p>Weather:{temp}</p>-->
    <!--<p>Temp309:{json[weather].id}</p>-->

    <h1 each ="{weather1}" value="{description}" >{main}</h1>
    <p>Tempurature:</p><h3>{CalAfter}</h3>
    <p each ="{weather1}" v lue="{description}" >{icon}</p>
    <p>SAMPLE:{weather0}</p>
    <p>icon CODE:{iconN}</p>

    <img url="{UrlV}"/>

        <script>
            var self = this;
            fetch( 'http://160.237.176.108/weather' )
                    .then( function ( data ) {
                        return data.json();
                    } )
                    .then( function ( json ) {
                        console.log(json);
                        self.weather1=json.weather;
                        self.temp=json.main;
                        self.result =json.main.temp;
                        self.weather0 =json.weather.icon;

                        var UrlV = 'http://openweathermap.org/img/w/' + self.weather1 + '.png'
                        self.iconN=UrlV;
                        var calB =self.result;
                        var calA =calB-273;
                        var calA
                        calA = parseInt(calA);
                        self.CalAfter=calA;
                        self.update();
                    } )
        </script>
</sresult>