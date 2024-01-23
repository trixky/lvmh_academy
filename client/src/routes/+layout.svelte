<!-- ------------------------------------ SCRIPT -->
<script lang="ts">
    import '../global.css'
    import '../reset.css'
    import Header from '$lib/layout/header.svelte';
    import Footer from '$lib/layout/footer.svelte';
</script>

<!-- ------------------------------------ CONTENT -->

<div class="layout-container">
    <Header />
    <main>
        <slot />
    </main>
    <Footer />
</div>

<!-- ------------------------------------ STYLE -->
<style lang="css">
    .layout-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
    }

    main {
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: start;
        padding: var(--main-block-padding);
        max-width: 400px;
    }
</style>