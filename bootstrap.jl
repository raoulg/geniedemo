(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using Geniedemo
const UserApp = Geniedemo
Geniedemo.main()
