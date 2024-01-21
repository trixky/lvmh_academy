<!-- ------------------------------------ SCRIPT -->
<script lang="ts">
	import { page } from '$app/stores';
</script>

<!-- ------------------------------------ CONTENT -->
<header>
	<a href="/?{$page.url.searchParams}">
		<img src="/complete-logo.svg" alt="SvelteKit logo" width="250" />
	</a>
</header>

<!-- ------------------------------------ STYLE -->
<style lang="css">
	header {
		padding: var(--main-block-padding);
	}
</style>
