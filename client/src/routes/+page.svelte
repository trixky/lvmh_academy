<!-- ------------------------------------ SCRIPT -->
<script lang="ts">
	import { browser } from '$app/environment';
	import { page } from '$app/stores';
	import { detect_device } from '$lib/logic/device';
	import { onMount } from 'svelte';

	const firstname = $page.url.searchParams.get('firstname');
	const lastname = $page.url.searchParams.get('lastname');
	const email = $page.url.searchParams.get('email');
	const phone = $page.url.searchParams.get('phone');

	const error: string | null =
		!firstname || !lastname ? "Le transfert d'information a échoué, veuillez réessayer." : null;

	let device: 'ios' | 'android' | 'other' = 'other';

	onMount(() => {
		if (browser) device = detect_device();
	});
</script>

<!-- ------------------------------------ CONTENT -->

<div class="main-container">
	<div class="black-container">
		<p>
			Vous étes sur le point de créer un compte client.<br />Veuillez vérifier les informations
			suivantes :
		</p>
		{#if error}
			<p class="error">{error}</p>
		{:else}
			<ul>
				<li>
					<p>Nom&nbsp;:&nbsp;</p>
					<p>{firstname}</p>
				</li>
				<li>
					<p>Prénom&nbsp;:&nbsp;</p>
					<p>{lastname}</p>
				</li>
				<li>
					<p>Email&nbsp;:&nbsp;</p>
					{#if email}
						<p>{email}</p>
					{:else}
						<p class="not-specified">non renseigné</p>
					{/if}
				</li>
				<li>
					<p>Téléphone&nbsp;:&nbsp;</p>
					{#if phone}
						<p>{phone}</p>
					{:else}
						<p class="not-specified">non renseigné</p>
					{/if}
				</li>
			</ul>
		{/if}
	</div>
	<div class="check-container">
		<div class="check CGU">
			<input type="checkbox" name="" id="" />
			<label for=""><p>Je confirme que les informations sont exactes.</p></label>
		</div>
		<div class="check CGU">
			<input type="checkbox" name="" id="" />
			<label for=""
				><p>
					J'accepte les <a href="/mvp?{$page.url.searchParams}"
						>conditions générales d'utilisation</a
					><br />de la maison LVMH.
				</p></label
			>
		</div>
	</div>
	<button class="button">Créer mon compte</button>
	{#if device != 'other'}
		<p class="wallet-explain">
			Une fois votre compte créé, vous pourrez ajouter à votre {device == 'android'
				? 'android'
				: 'Apple'} Wallet.
		</p>
	{/if}
</div>

<!-- ------------------------------------ STYLE -->
<style lang="css">
	.main-container {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.main-container > div {
		text-align: center;
	}

	.main-container > div > p:first-child {
		margin-bottom: var(--main-block-margin);
	}

	.main-container > div > p.error {
		color: red;
	}

	ul {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		list-style-type: none;
		width: 100%;
	}

	li {
		display: flex;
		flex-direction: row;
		margin-bottom: var(--main-half-margin);
		width: 100%;
	}

	li > p {
		width: 50%;
		text-align: start;
		font-weight: bold;
	}

	li > p:first-child {
		text-align: end;
		font-weight: normal;
	}

	li > p.not-specified {
		color: grey;
		text-decoration: line-through;
		font-weight: normal;
	}

	p {
		font-size: var(--main-text-small);
	}

	.error {
		color: red;
	}

	.check-container {
		display: flex;
		flex-direction: column;
		justify-content: start;
		align-items: start;
		padding: var(--main-block-padding);
		margin: var(--main-block-margin);
		padding-top: 0;
		margin-top: 0;
	}

	.check {
		display: flex;
		flex-direction: row;
		align-items: start;
		justify-content: start;
	}

	.check:first-child {
		margin-bottom: var(--main-half-margin);
	}

	.check > input {
		margin-right: var(--main-half-margin);
	}

	.check > label > p {
		font-size: var(--main-text-small);
		text-align: start;
	}

	p.wallet-explain {
		color: grey;
		font-size: var(--main-text-small);
		text-align: center;
		padding: var(--main-block-padding);
		margin: var(--main-block-margin);
		padding-top: 0;
		margin-top: 0;
	}
</style>
