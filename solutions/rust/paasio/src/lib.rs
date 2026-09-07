use std::io::{Read, Result, Write};

pub struct ReadStats<R> {
    wrapped: R,
    op_count: usize,
    byte_count: usize
}

impl<R: Read> ReadStats<R> {
    pub fn new(wrapped: R) -> ReadStats<R> {
        Self {
            wrapped: wrapped,
            op_count: 0,
            byte_count: 0
        }
    }

    pub fn get_ref(&self) -> &R {
        &self.wrapped
    }

    pub fn bytes_through(&self) -> usize {
        self.byte_count
    }

    pub fn reads(&self) -> usize {
        self.op_count
    }
}

impl<R: Read> Read for ReadStats<R> {
    fn read(&mut self, buf: &mut [u8]) -> Result<usize> {
        let r = self.wrapped.read(buf);
        match r {
            Ok(b) => {
                self.op_count += 1;
                self.byte_count += b;
            },
            _ => {}
        }
        r
    }
}

pub struct WriteStats<W> {
    wrapped: W,
    op_count: usize,
    byte_count: usize
}

impl<W: Write> WriteStats<W> {
    pub fn new(wrapped: W) -> WriteStats<W> {
        Self {
            wrapped: wrapped,
            op_count: 0,
            byte_count: 0
        }
    }

    pub fn get_ref(&self) -> &W {
        &self.wrapped
    }

    pub fn bytes_through(&self) -> usize {
        self.byte_count
    }

    pub fn writes(&self) -> usize {
        self.op_count
    }
}

impl<W: Write> Write for WriteStats<W> {
    fn write(&mut self, buf: &[u8]) -> Result<usize> {
        let r = self.wrapped.write(buf);
        match r {
            Ok(b) => {
                self.op_count += 1;
                self.byte_count += b;
            },
            _ => {}
        }
        r
    }

    fn flush(&mut self) -> Result<()> {
        self.wrapped.flush()
    }
}
