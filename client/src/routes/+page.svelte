<!-- ------------------------------------ SCRIPT -->
<script lang="ts">
	import { browser } from '$app/environment';
	import { page } from '$app/stores';
	import { detect_device } from '$lib/logic/device';
	import { onMount } from 'svelte';

	let firstname = $page.url.searchParams.get('firstname');
	let lastname = $page.url.searchParams.get('lastname');
	let email = $page.url.searchParams.get('email');
	let phone = $page.url.searchParams.get('phone');

	const error_transfer: string | null =
		!firstname || !lastname ? "Le transfert d'information a échoué, veuillez réessayer." : null;

	let device: 'ios' | 'android' | 'other' = 'other';

	let check_confirmation = false;
	let check_CGU = false;

	$: check_full = check_confirmation && check_CGU;

	onMount(() => {
		if (browser) device = detect_device();
	});

	let error_checkbox: string | null = null;

	function handle_submit() {
		if (check_full) {
			error_checkbox = null;
		} else {
			error_checkbox =
				"Veuillez confirmer vos informations et accepter les conditions générales d'utilisation.";
		}
	}

	function handle_check() {
		error_checkbox = null;
	}
</script>

<!-- ------------------------------------ CONTENT -->

<div class="main-container">
	<div class="black-container">
		<p>
			Vous êtes sur le point de créer un compte client.<br />Veuillez vérifier les informations
			suivantes :
		</p>
		{#if error_transfer}
			<p class="error">{error_transfer}</p>
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
	<div class="check-confirmation-container" class:blocked={error_transfer}>
		<div class="check-container">
			<div class="check CGU">
				<input
					type="checkbox"
					name=""
					id=""
					on:change={handle_check}
					bind:checked={check_confirmation}
					disabled={error_transfer != null}
				/>
				<label for=""><p>Je confirme que les informations sont exactes.</p></label>
			</div>
			<div class="check CGU">
				<input
					type="checkbox"
					name=""
					id=""
					on:change={handle_check}
					bind:checked={check_CGU}
					disabled={error_transfer != null}
				/>
				<label for=""
					><p>
						J'accepte les <a href="/mvp?{$page.url.searchParams}"
							>conditions générales d'utilisation</a
						><br />de la maison LVMH.
					</p></label
				>
			</div>
		</div>
		<div class="confirmation-container">
			{#if error_checkbox}
				<p class="error">{error_checkbox}</p>
			{/if}
			<button class="button" on:click={handle_submit} disabled={error_transfer != null}>
				<img src="/card.svg" width="50px" alt="">
				<p>Obtenir ma carte</p>
			</button>
			{#if device != 'other'}
				<p class="wallet-explain">
					Une fois votre compte créé, vous pourrez ajouter à votre {device == 'android'
						? 'android'
						: 'Apple'} Wallet.
				</p>
			{/if}
		</div>
	</div>
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
		text-align: center;
	}

	.check-confirmation-container {
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.check-confirmation-container.blocked {

		pointer-events: none;
		opacity: 0.3;
	}

	.confirmation-container {
		position: relative;
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}

	.confirmation-container .error {
		position: absolute;
		top: -20px;
		width: 300px;
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

	button {
		width: fit-content
	}
</style>
