import { HarmonyPlatform } from '@bitdev/harmony.harmony-platform';
import { NodeJSRuntime } from '@bitdev/harmony.runtimes.nodejs-runtime';
import { BrowserRuntime } from '@bitdev/harmony.runtimes.browser-runtime';
import { SymphonyPlatformAspect } from '@bitdev/symphony.symphony-platform';
import { PeopleAspect } from '@bitdev/symphony.examples.people';
import { HeaderAspect } from '@bitdev/symphony.aspects.header';

/**
  * platform composition of the test-platform platform.
  */    
export const TestPlatform = HarmonyPlatform.from({
  platform: [SymphonyPlatformAspect, {
    name: 'TestPlatform',
    slogan: 'Platform',
    logo: 'https://static.bit.dev/extensions-icons/wayne.svg',
  }],

  runtimes: [
    new BrowserRuntime(), 
    new NodeJSRuntime()
  ],

  aspects: [
    // you can use the symphony header aspect or fork to build your own.
    HeaderAspect,
    // example feature, replace with your own.
    PeopleAspect
  ],
});

export default TestPlatform;
