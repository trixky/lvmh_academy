<!-- ------------------------------------ SCRIPT -->
<script lang="ts">
	import { page } from '$app/stores';
</script>

<!-- ------------------------------------ CONTENT -->
<footer>
	<ul>
		<li>
			<a href="/mvp?{$page.url.searchParams}"><p>Aide</p></a>
		</li>
		<li>
			<a href="/mvp?{$page.url.searchParams}"><p>Mentions légales</p></a>
		</li>
		<li>
			<a href="/mvp?{$page.url.searchParams}"><p>Cookies</p></a>
		</li>
	</ul>
</footer>

<!-- ------------------------------------ STYLE -->
<style lang="css">
    footer {
        display: flex;
        margin: var(--main-block-margin);
        padding: var(--main-block-padding);
    }

    ul {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        list-style-type: none;
    }

    li {
        margin: 0 1rem;
    }

    a {
        text-decoration: none;
        color: #000;
    }

    p {
        font-size: var(--main-text-small);
    }
</style>
