    function loginFacebook() {
        LS.facebookLogin(FB, function(status, hasEmail) {
            if (status === 'connected') {
                if (hasEmail) {
                    window.location = "{{ store.url }}/account/facebook_login/";
                } else {
                    $('#login-form').prepend(
                            "<div class=\"st error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                }
            } else {
                $('#login-form').prepend(
                        "<div class=\"st error c\">{{ 'Debes completar el login.' | translate }}</div>");
            }
        });
    }