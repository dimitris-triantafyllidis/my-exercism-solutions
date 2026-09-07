#[derive(Debug)]
pub struct ChessPosition {
    pub rank: i32,
    pub file: i32
}

#[derive(Debug)]
pub struct Queen {
    pub chess_position: ChessPosition
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        if rank < 0 || rank > 7 || file < 0 || file > 7 {
            return None;
        }
        else {
            return Some (
                Self {
                    rank: rank,
                    file: file
                }
            );
        }
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        return Self {
            chess_position: position
        };
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        return
            (self.chess_position.rank == other.chess_position.rank) ||
            (self.chess_position.file == other.chess_position.file) ||
            (
                (self.chess_position.file - other.chess_position.file).abs() ==
                (self.chess_position.rank - other.chess_position.rank).abs()
            );
    }
}
