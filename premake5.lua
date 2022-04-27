project "msdf-atlas-gen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    staticruntime "on"

    targetdir ("%{prj.location}/bin/" .. outputdir)
    objdir ("%{prj.location}/bin-int/" .. outputdir)

    files 
    {
        "msdf-atlas-gen/**.cpp",
        "msdf-atlas-gen/**.hpp",
        "msdf-atlas-gen/**.h"
    }

    includedirs 
    {
        "msdf-atlas-gen",
        "%{wks.location}/TerranEngine/vendor/msdfgen/",
    }

    links 
    {
        "msdfgen"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"        
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
