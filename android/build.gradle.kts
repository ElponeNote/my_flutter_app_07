allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

plugins {
    id("com.google.gms.google-services") version "4.4.2" apply false
}

dependencies {
    // Import the Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:33.14.0"))

    // TODO: Add the dependencies for Firebase products you want to use
    // 예시: Firebase Analytics
    // implementation("com.google.firebase:firebase-analytics")

    // 예시: Firebase Auth
    implementation("com.google.firebase:firebase-auth")
}
