import {
  CheckboxInput,
  Feature,
  FeatureColorInput,
  FeatureToggle,
  FeatureTriColorInput,
} from '../base';

export const fluff_color: Feature<string[]> = {
  name: 'Fluff Color',
  component: FeatureTriColorInput,
};

export const default_legs_color: FeatureToggle = {
  name: 'Legs Custom Color',
  description: `
    When toggled, pick a color for the legs different from the skintone.
  `,
  component: CheckboxInput,
};

export const legs_color: Feature<string> = {
  name: 'Legs Color',
  component: FeatureColorInput,
};
