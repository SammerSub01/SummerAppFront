require('./logname.tag');
<login>
    <logname title="What About The Weather Today" ></logname>
    <div class="row">
        <form class="col s12" onSubmit={pos}>
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
            <div class="row" >
                <button class="waves-effect waves-light btn col s12"  >button</button>
            </div>

        </form>
    </div>
    <script>
        this.pos = function(e){
            const username = this.user_name.value;
            const password = this.password.value;

            e.preventDefault();
            console.log(username);
            console.log(password);

            fetch('http://localhost/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    user_name: username,
                    password: password,
                })
            }).then(function(response) {
                return response.json();
            }).then(function(json) {
                console.log(json);
                riot.route('weather' + '?token=' + json.token)
            });
        };
    </script>
</login>