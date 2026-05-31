# Breezy

Breezy is a mobile on-demand cleaning platform that instantly connects users across Ontario with trusted, vetted cleaning professionals. The app enables customers to quickly search, compare, and book cleaners based on real-time availability, location, verified reviews, pricing, and urgency, including same-day service requests. By streamlining the booking process through a centralized and user-friendly platform, the service delivers fast, transparent, and reliable access to professional cleaning while creating flexible earning opportunities for cleaners.

## Getting Started

### Architecture

For the project structure, the app uses a feature first approach where the code is organised per feature

For app structure, layered  is used, where separation of logic and data flow is through the presentation, domain, app and data layers

### Design Sytem

The app uses Material 3 color system, system generated from the seed color, additionally uing [Flex Color Scheme](https://pub.dev/packages/flex_color_scheme) for overall theming of the components.

For a closer look at generated color system, check this out in [material theme builder](https://material-foundation.github.io/material-theme-builder/), using our primary #00C3D0

Typography is [Google-Sans](https://fonts.google.com/specimen/Google+Sans?query=sans) , and for over all [text specs](https://m3.material.io/styles/typography/type-scale-tokens)


### Routing System

Based on the declarative routing style of Navigation 2.0 through [GoRouter pacakage](https://pub.dev/packages/go_router/)

Ensure strongly typed parameter types with [Go Router Builder](https://pub.dev/packages/go_router_builder). This eases detectibility at compile-time instead of at run-time.