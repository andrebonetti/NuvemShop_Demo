	<div class="header-bar">
	
		<!-- HEADER FIXED -->
		{% if settings.fixed_menu %}
			<div class="header-bar-fixed" data-spy="affix" data-offset-top="250" data-offset-bottom="200">
				<div class="container">
					<div class="row">
						<div class="col-sm-3 logo-container">
							{% if "fixed_menu_logo.jpg" | has_custom_image %}
								<div id="logo" class="img">
									{{ "fixed_menu_logo.jpg" | static_url | img_tag(store.name) | a_tag(store.url) }}
								</div>
							{% elseif has_logo %}
								<div id="logo" class="img">
									{{ store.logo | img_tag(store.name) | a_tag(store.url) }}
								</div>
							{% else %}
								<div id="logo">
									<a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
								</div>
							{% endif %}
						</div>
						<div class="col-md-12 cart-mobile">
							{% snipplet "cart_mobile.tpl" %}
						</div>
						<nav class="col-sm-9">
							<ul id="menu-fixed" class="sf-menu">
								{% snipplet "navigation.tpl" %}
								<!-- Carrito -->
								{% snipplet "cart_fixed.tpl" %}
							</ul>
							<nav class="mobile">
								<select class="on-steroids" name="main_navigation" id="main_navigation" onchange="location = this.options[this.selectedIndex].value;">
									{% snipplet "navigation-mobile.tpl" %}
								</select>
							</nav>
						</nav>
					</div>
				</div>
			</div>
		{% endif %}
		
		<!-- HEADER BAR -->
		<div class="header-bar-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 text-left col-izq-top">
						{% if languages | length > 1 %}
							<div class="languages dropdown">
								{% for language in languages %}
									{% if language.active %}
										<a  class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
											{{ language.country | flag_url | img_tag(language.name) }}
											<span class="caret"></span>
										</a>
									{% endif %}
								{% endfor %}
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
									{% for language in languages %}
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="{{ language.url }}" class="{{ class }}">
												{{ language.country | flag_url | img_tag(language.name) }}<span>&nbsp{{ language.name }}</span>
											</a>
										</li>
									{% endfor %}
								</ul>
							</div>
						{% endif %}
						{% if store.phone %}
							<p class="phone">
								{{ store.phone }}
								{% if store.email %}
									&nbsp;|&nbsp;
								{% endif %}
							</p>
						{% endif %}
						{% if store.email %}
							<p class="mail">{{ store.email | mailto }}</p>
						{% endif %}
					</div>
					<div class="col-sm-7 text-right col-der-top">
						{% if store.has_accounts %}
							<div id="auth">
								{% if not customer %}
									{% if 'mandatory' not in store.customer_accounts %}
										{{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
										<span>&nbsp;|&nbsp;</span>
									{% endif %}
									{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
								{% else %}
									{{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
									<span>&nbsp;|&nbsp;</span>
									{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
								{% endif %}
							</div>
						{% endif %}
						<div class="searchbox">
							<form action="{{ store.search_url }}" method="get" role="form">
								<input class="text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
								<i class="fa fa-search"></i>
								<input class="submit-button" type="submit" value=""/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- HEADER CONTAINER -->
		<div class="header-bar-main container">
			<div class="row text-center">
				<div class="col-md-12 logo-container">
					{% if has_logo %}
						{% if template == 'home' %}
							<h1 class="img logo">
								<div id="logo" class="img">
									{{ store.logo | img_tag(store.name) | a_tag(store.url) }}
								</div>
							</h1>
						{% else %}
							<div id="logo" class="img">
								{{ store.logo | img_tag(store.name) | a_tag(store.url) }}
							</div>
						{% endif %}     
					{% else %}
						{% if template == 'home' %}
							<h1 class="img logo">
								<div id="logo" class="img">
									<a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
								</div>
							</h1>
						{% else %}
							<div id="logo">
								<a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
							</div>
						{% endif %}
					{% endif %}
				</div>
				<div class="col-md-12 cart-mobile">
					{% snipplet "cart_mobile.tpl" %}
				</div>
			</div>
			<div class="row text-center">
				<nav>
					<ul id="menu" class="sf-menu">
						{% snipplet "navigation.tpl" %}
						<!-- Carrito -->
						{% snipplet "cart.tpl" %}
					</ul>
					<nav class="mobile">
						<select class="on-steroids" name="main_navigation" id="main_navigation" onchange="location = this.options[this.selectedIndex].value;">
							{% snipplet "navigation-mobile.tpl" %}
						</select>
					</nav>
				</nav>
			</div>
		</div>
	</div>