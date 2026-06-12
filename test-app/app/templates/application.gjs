import pageTitle from 'ember-page-title/helpers/page-title';
import { LinkTo } from '@ember/routing';

<template>
  {{pageTitle "ember-cli-nouislider"}}

  <header class="app-header">
    <h1>ember-cli-nouislider</h1>
    <nav>
      <LinkTo @route="index">Home</LinkTo>
      |
      <LinkTo @route="options">Options</LinkTo>
      |
      <LinkTo @route="events">Events</LinkTo>
    </nav>
  </header>

  <main>
    {{outlet}}
  </main>
</template>
