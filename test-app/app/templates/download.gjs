import SourceCode from 'test-app/components/source-code';

const installCode = `ember install ember-cli-nouislider`;

const importCssCode = `// app/app.js
import 'nouislider/dist/nouislider.css';`;

<template>
  <div class="page">
    <h1>Download &amp; Install</h1>

    <section>
      <h2 id="ember-cli">
        <a href="#ember-cli" class="anchor">§</a>
        ember-cli
      </h2>
      <p>
        Install the addon into your Ember app:
      </p>
      <SourceCode @lang="bash" @code={{installCode}} />
      <p>
        Then load the noUiSlider stylesheet alongside your app's CSS:
      </p>
      <SourceCode @lang="javascript" @code={{importCssCode}} />
    </section>

    <section>
      <h2 id="repository">
        <a href="#repository" class="anchor">§</a>
        Repository
      </h2>
      <p>
        Source lives at
        <a
          href="https://github.com/kennethkalmer/ember-cli-nouislider"
        >github.com/kennethkalmer/ember-cli-nouislider</a>. File issues, send
        PRs, or reach out to
        <a href="https://github.com/kennethkalmer">@kennethkalmer</a>
        on GitHub.
      </p>
    </section>

    <section>
      <h2 id="versioning">
        <a href="#versioning" class="anchor">§</a>
        Versioning
      </h2>
      <p>
        v2.x is a v2 Embroider addon targeting Ember 6.12 LTS and above. v1.x is
        the classic ember-cli addon for older Ember versions and is no longer
        actively maintained.
      </p>
    </section>
  </div>
</template>
