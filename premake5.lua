include "msdfgen"

project "msdf-atlas-gen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    staticruntime "on"

    architecture "x86_64"

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
        "msdfgen/",
        "msdfgen/include",
    }

    disablewarnings 
    {
        4267
    }

    links 
    {
        "msdfgen"
    }

    defines 
    {
        "_CRT_SECURE_NO_WARNINGS"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"        
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
