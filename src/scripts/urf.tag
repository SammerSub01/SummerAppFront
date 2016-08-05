<urf>
    <div class="row">
        <form class="col s12" onSubmit={register}>
            <div class="row">
                <div class="input-field col s6">
                    <input id="user_name" type="text" name="input" onkeyup="{ edit }">
                    <label for="user_name">ユーザー名</label>
                </div>
                <div class="input-field col s6">
                    <input id="password" type="text"  name="input" onkeyup="{ edit }">
                    <label for="password">パスワード</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <select class="col s12" id="prefecture_id">
                        <option value="" disabled selected onchange="{cheack}">住んでいる地域を選択</option>
                        <option each ="{prefectures}" value="{id}" >{name}</option>
                    </select>
                    <label>都道府県の選択</label>
                </div>
            </div>
            <div class="row" >
                <button class="waves-effect waves-light btn col s12"  disabled={ !text }>button</button>
            </div>

        </form>
    </div>
    <script>
        var self = this;
        fetch( 'https://fast-reef-14433.herokuapp.com/prefectures' )
                .then( function ( data ) {
                    return data.json();
                } )
                .then( function ( json ) {
                    self.prefectures = json;
                    self.update();
                    $('select').material_select();
                } )

        self.edit = function(e){
            if(this.user_name.value != "" && this.password.value != "") {
                this.text = e.target.value;
            }
        };

        self.register = function(e){
            const username = this.user_name.value;
            const password = this.password.value;
            const prefectures = this.prefecture_id.value;

            e.preventDefault();
            console.log(username);
            console.log(password);
            console.log(prefectures);
            fetch('http://localhost/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    user_name: username,
                    password: password,
                    prefecture_id: prefectures,
                })
            }).then(function(response) {
                return response.text();
            }).then(function(text) {
                console.log(text);
                riot.route('users')
            });
        };

    </script>
</urf>