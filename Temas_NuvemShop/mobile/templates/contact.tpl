<nav class="breadcrumb">
	<ul>
		<li><a href="{{ store.url }}" class="home" title="{{ store.name }}">{{ store.name }}</a></li>
	{% for crumb in breadcrumbs %}
		{% if crumb.last %}
		<li>{{ crumb.name }}</li>
		{% else %}
		<li><a href="{{ crumb.url }}">{{ crumb.name }}</a></li>
		{% endif %}
	{% endfor %}
		<li>{{ "Contato"| t }}</li>
	</ul>
</nav>
<section id="contact">
	
	{% if contact and contact.success and contact.type == 'contact' %}
	<p class="contact-success">{{ "A mensagem foi enviada com sucesso, muito obrigado." | t }}</p>

	{% else %}
	{% if store.phone or store.email or store.address %}
	<section id="info">
		<h2>{{ "Informações de contato" |  t }}</h2>
		<p>{{ store.contact_intro }}</p>
		<address>
			{% if store.phone %}
				<p class="phone"><em>{{ "telefone:" | t }}</em> {{ store.phone }}</p>
			{% endif %}
			{% if store.email %}
				<p class="mail"><em>{{ "e-mail:" |  t}}</em> <a href="mailto:{{ store.email }}">{{ store.email }}</a></p>
			{% endif %}
			{% if store.address %}
				<p class="address"><em>{{ "endereço:" | t }}</em> {{ store.address }}</p>
			{% endif %}
		</address>
	</section>
	{% endif %}

	<section id="contact-form">
		<h2>{{ "Formulário para contato" | t }}</h2>
		<form action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
			<input type="hidden" value="{{ product.id }}" name="product"/>

			{% if contact and not contact.success and contact.type == 'contact' %}
			<p class="contact-error">{{ "Verifique os dados digitados para que possamos entrar em contato." | t }}</p>
			{% endif %}
		
			<label>{{ "Nome" | t }}</label>
			<input type="text" id="name" name="name"/>
			
			<label>{{ "Telefone" | t }} <span class="mini-text">(Opcional)</span></label>
			<input type="text" id="phone" name="phone"/>
			
			<label>{{ "E-mail" | t }}</label>
			<input type="email" id="email" name="email"/>

	        <div class="winnie-pooh">
	            <label for="winnie-pooh">{{ "No completar este campo" | t }}</label>
	            <input id="winnie-pooh" type="text" name="winnie-pooh"/>
	        </div>

			<label>{{ "Consulta" | t }} <span class="mini-text">(Opcional)</span></label>
			<textarea name="message" rows="4" cols="6"></textarea>
			
			<input type="submit" value="{{ 'Enviar' | t }}" name="contact" class="primary-btn" />
			<input type="hidden" value="contact" name="type"/>
		</form>
	</section>

	{% endif %}
</section>

