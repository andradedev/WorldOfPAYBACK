# WorldOfPAYBACK
A UIKit to SwiftUI migration architecture

# Home Screen
It was coded thinking about a project that was UIKit and needed to move to SwiftUI, 
so the first thing to do was a pattern that would accept both. 

After that we used combine to manipulate all events that would affect the view. 

For our network, using concurrency was a important step, and because the challenge didn't need the network code, 
i focused on another structure. 

After all of this is done, we can see that I used MVVM for the architecture with Coordinator for moving between screens. 

# PBCore
I constructed a small module to represent what we must build in a project that would be at scale, 
a module for all main classes that we would need. And also a module for network would be needed, 
check out this network structure from a few years ago using cocoapods: https://github.com/andradedev/iBeer/tree/master/SDKNetwork

After we have this architecture, we could build the app at scale by building only the start of the app on the main project and using Feature Modules for all other implementations, making sure that the efficiency of the developers is high ( low amount of code for maintenance per team and also really fast build time) and also that the features are coming at a good pace. 

# TODO

Build the Network flow, that we can see in a previous code of mine above in the link, that it can be done very simply and very optimal. 

Build Unit Tests, I personally like mostly to use XCTest, the native way of testing an app because we have more freedom to make a lot of tests and make sure our application is resilient. 

Build UITests, It is important to make sure the flow that we expect to deliver is being tested even after it is in production to make sure we don't break anything. 

You can see my Skill on Unit tests and UITests on https://github.com/andradedev/iBeer 
Sorry but the README file is in portuguese. 

I think this project can show a bit of my skill. I am currently working as a Tech Lead on a very important Banking company. 
So I dont have much free time to work on side projects. This was made with 9 hours of coding and 1 hour documenting it in this very file.
I am sure I could have done more, but one thing that I can't do is delay this delivery. Thanks for the opportunity. 
