<script>
	import { LL } from '@i18n';
</script>

<section class="m-4 flex h-screen flex-row items-center justify-center">
	<div class="card card-image-cover max-w-xl">
		<div class="card-body">
			<h2 class="card-header">{$LL.asdf.title()}</h2>
			<p class="text-content2">
				{$LL.asdf.description()}
			</p>
			<div class="card-footer">
				<a class="btn btn-primary" href="https://github.com/dart-pacotes/.bricks" target="_blank"
					>{$LL.asdf.actions.visit()}</a
				>
			</div>
		</div>

		<a href="https://github.com/dart-pacotes/.bricks" target="_blank">
			<img
				src="https://opengraph.githubassets.com/.../dart-pacotes/.bricks"
				alt="banner of dart-pacotes bricks github repository"
			/>
		</a>
	</div>
</section>
