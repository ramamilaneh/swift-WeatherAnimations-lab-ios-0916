# Swift Weather Animations

![Picard](https://upload.wikimedia.org/wikipedia/en/2/20/Captain_Picard_Chair.jpg)
> Make it so. —[Captain Picard](https://en.wikipedia.org/wiki/Jean-Luc_Picard)

### Goals
By the end of this lab the student should:

  * Be familiar with using views programmatically
  * Be familiar with animations using keyframes
  * Be able to start, chain, and repeat animations

## Ditching the Storyboard

Open up the project. You may have noticed that there's no `main.storyboard`. On many development teams, storyboard files are shunned in favor of working entirely in code. This is due to the challenges of managing merge conflicts that arise when multiple people work on the UI of an app.

Storyboards are notorious for being persnickety, and will register and automatically save imperceptible alterations if you even open and look at them without changing any of the content. The problem is compounded by how these errors are handled in Xcode, which prevents you from opening a storyboard file if there are any reported conflicts within it. When you finally manage to open the storyboard file in a plaintext editor, the conflicts themselves are very difficult to interpret.

There's much discussion around handling storyboard-based UI development, and there are many ways to make it work for a team. Some companies, however, completely do away with storyboards and instead load view controllers directly from code.

### Enlightened by Dark Magic

If you look in the `AppDelegate` file, you'll see an optional `UIWindow` property called `window`. Normally, the project settings point toward a primary interface for our app, which defaults to `main.storyboard`. This automatically instantiates a `UIWindow`, which is then passed to the `AppDelegate`. The `window` is then given the initial view controller by the storyboard.

Instead of using a storyboard to create a `UIWindow`, this is now taken care of in `AppDelegate`'s `application(_:didFinishLaunchingWithOptions:)`. After setting the value for the `window` property, an instance of `WeatherViewController` is created, set as the root view controller, and presented to the user. From here, the view controller is free to do its thing.

This may or may not come up in the code you write and work on, but it's a great way to get a sense of what goes on under the hood any time you open up an app!

## Instructions

The following instructions are intentionally vague in an attempt to mimic real-world conditions. In many instances, a designer and/or product manager (PM) will give you specificaions for how your app should look and operate, and it's up to you to "make it so".

Here's what your app is expected to do:

1. Gradually cycle the background color between `blue`, `cyan`, and `black` over 20 seconds to simulate the day/night cycle. Colors may be used more than once in the cycle. This should start automatically and repeat indefinitely.
2. Animate the sun and the moon images to cycle in accordance with the change from day to night and back again. This should also start automatically and repeat indefinitely. Be sure the animation uses `.calculationModeCubic` to ensure smoothness.
3. Include a 50 x 50 `stormButton` that, when tapped, causes the cloud image to fade in, float up and down for eight seconds, and fade back out. The button should be white with a gray border.
4. Three seconds after the cloud animation begins, a one-second animation of the lightning flash should occur. It's hard to see in the following gif, but the bolt should flash three times in the span of a single second, then `.autoreverse` before it disappears for good.

This is how your app should look:

![Weather](https://media.giphy.com/media/l0HlJU8z1NACP4V9u/giphy.gif)

The four images you are required to use in this app have been provided in the `Assets` folder and can be accessed by using their names: `Sun`, `Moon`, `Cloud`, and `Lightning`.

## Advanced Challenges

Attempt the following challenges only if you feel comfortable with the preceding instructions. These are ordered by increasing difficulty and there 

### Challenge 1

Don't use constraints at all. Sounds crazy, right? But it's totally doable. In fact, the example animation gifs were all created with animation on the `frame`s of each view.

### Challenge 2

Replace the sun and moon animation with methods from the `CAAnimation` class. Specifically, find a way to animate the rise and fall of the sun and moon along a circular bezier curve path.

### Challenge 3

What's a storm without some rain? (Heat lightning!) Find a way to animate rainfall when the `stormButton` is tapped. It should start only after the cloud has fully appeared and end before the cloud disappears.

**Warning:** There is no official solution for Challenge 3. There are many potential avenues you can follow, but the eventual outcome is up to you!
