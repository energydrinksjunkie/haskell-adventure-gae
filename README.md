# Haskell Adventure Game

This is a text-based adventure game written in Haskell as a seminar project for university. The game reads scene descriptions from text files and allows the player to make choices to navigate through different scenes.

## Getting Started

### Prerequisites

- Haskell Platform (GHC and Cabal)

## Building the Project

To build the project, use the following command:

```sh
cabal build
```

Cabal will automatically install any necessary dependencies.

## Running the Game

After building, you can run the game with:

```sh
cabal run
```

## Project Structure

- `src/Main.hs` - The main entry point of the game.
- `src/Scenes.hs` - Contains functions for reading and parsing scene files.
- `src/Types.hs` - Defines the data structures used in the game.
- `src/scenes/` - Folder containing the scene description files.

## Example Scene File

Each scene file contains ASCII art, a description, and options for the player to choose from, separated by double newlines (\n\n). Here is an example:

```
  _____
 /     \
| () () |
 \  ^  /
  |||||
  |||||

You wake up in a dark room. What do you do?

Explore the room -> scene
Go back to sleep -> scene
```
