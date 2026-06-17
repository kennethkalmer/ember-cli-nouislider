import pageTitle from 'ember-page-title/helpers/page-title';
import { LinkTo } from '@ember/routing';

<template>
  {{pageTitle "ember-cli-nouislider"}}

  <header class="app-header">
    <nav class="app-nav">
      <LinkTo @route="index" class="app-nav-link">Home</LinkTo>
      <LinkTo @route="component" class="app-nav-link">Component</LinkTo>
      <LinkTo @route="options" class="app-nav-link">Options</LinkTo>
      <LinkTo @route="events" class="app-nav-link">Events</LinkTo>
      <LinkTo @route="download" class="app-nav-link">Download</LinkTo>
      <a
        class="app-nav-link"
        href="https://refreshless.com/nouislider/"
        target="_blank"
        rel="noopener noreferrer"
      >Powered by noUiSlider</a>
    </nav>
  </header>

  <main>
    {{outlet}}
  </main>
</template>
