use std::collections::VecDeque;

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

pub struct CircularBuffer<T> {
    e: VecDeque<T>,
    capacity: usize,
}

impl<T> CircularBuffer<T> {
    pub fn new(capacity: usize) -> Self {
        Self {
            e: VecDeque::with_capacity(capacity),
            capacity,
        }
    }

    pub fn write(&mut self, element: T) -> Result<(), Error> {
        if self.e.len() == self.capacity {
            return Err(Error::FullBuffer);
        }
        self.e.push_back(element);
        Ok(())
    }

    pub fn read(&mut self) -> Result<T, Error> {
        self.e.pop_front().ok_or(Error::EmptyBuffer)
    }

    pub fn clear(&mut self) {
        self.e.clear();
    }

    pub fn overwrite(&mut self, element: T) {
        if self.e.len() == self.capacity {
            self.e.pop_front();
        }
        self.e.push_back(element);
    }
}
