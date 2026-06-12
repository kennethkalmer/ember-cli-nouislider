import EventDemo from 'test-app/components/event-demo';

<template>
  <section>
    <h2>Events</h2>
    <p>
      noUiSlider fires
      <code>change</code>,
      <code>set</code>,
      <code>slide</code>,
      <code>update</code>,
      <code>start</code>,
      <code>end</code>. Pass callbacks via
      <code>@onChange</code>,
      <code>@onSet</code>, etc.
    </p>

    <EventDemo />
  </section>
</template>
