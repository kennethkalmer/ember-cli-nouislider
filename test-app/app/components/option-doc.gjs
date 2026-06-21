<template>
  <section class="option-section">
    <h2 id={{@anchor}}>
      <a href="#{{@anchor}}" class="anchor">§</a>
      {{@title}}
    </h2>
    <div class="doc-row">
      <div class="doc-prose">
        {{yield to="prose"}}

        <div class="option-example">
          {{yield to="example"}}
        </div>

        <dl class="option-meta">
          <dt>Default</dt>
          <dd>
            {{#if @default}}
              <code>{{@default}}</code>
            {{else}}
              <em>none</em>
            {{/if}}
          </dd>
          <dt>Accepted</dt>
          <dd>{{@accepted}}</dd>
        </dl>
      </div>

      <div class="doc-code">
        {{yield to="code"}}
      </div>
    </div>
  </section>
</template>
